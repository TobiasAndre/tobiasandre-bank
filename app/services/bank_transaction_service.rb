# frozen_string_literal: true

class BankTransactionService
  NotEnoughFundsError = Class.new(StandardError)

  def initialize(amount:, transaction_type:, origin_bank_account:, destination_bank_account:)
    @amount = amount
    @transaction_type = transaction_type
    @origin_bank_account = origin_bank_account
    @destination_bank_account = destination_bank_account
  end

  def execute!
    ActiveRecord::Base.transaction do
      AccountTransaction.create!(amount: @amount, transaction_type: @transaction_type,
                                 origin_bank_account: @origin_bank_account,
                                 destination_bank_account: @destination_bank_account)

      if @transaction_type.name == "deposit"
        deposit
      elsif @transaction_type.name == "transfer"
        transfer
      elsif @transaction_type.name == "withdraw"
        withdraw
      end
    end
  end

  def deposit
    @origin_bank_account.update(balance: @origin_bank_account.balance + @amount)
  end

  def transfer
    raise NotEnoughFundsError, "Not enougth funds for this transfer" if @origin_bank_account.balance < @amount

    @origin_bank_account.update(balance: @origin_bank_account.balance - @amount)
    @destination_bank_account.update(balance: @destination_bank_account.balance + @amount)
  end

  def withdraw
    raise NotEnoughFundsError, "Not enougth funds for this withdraw" if @origin_bank_account.balance < @amount

    @origin_bank_account.update(balance: @origin_bank_account.balance - @amount)
  end
end
