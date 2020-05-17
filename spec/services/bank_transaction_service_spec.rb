# frozen_string_literal: true

require "rails_helper"

describe BankTransactionService do
  subject(:bank_transaction) { described_class.new(params).execute! }

  describe "#execute" do
    let!(:origin_bank_account) { create(:bank_account) }
    let!(:destination_bank_account) { create(:bank_account) }
    
    let(:params) do
      {
        amount: 100.0,
        transaction_type: transaction_type,
        origin_bank_account: origin_bank_account,
        destination_bank_account: destination_bank_account
      }
    end
    
    context "when we have a 100 deposit" do
      let!(:transaction_type) { create(:transaction_type, name: 'deposit') }
      it "returns a deposit transaction" do
        expect(bank_transaction).to be_truthy
      end
    end

    context "when we have a 100 withdraw without enough funds" do
      let!(:transaction_type) { create(:transaction_type, name: 'withdraw') }
      it "returns a not funds error on withdraw transaction" do
        expect { bank_transaction }.to raise_error(BankTransactionService::NotEnoughFundsError)
      end
    end

    context "when we have a 100 transfer without enough funds" do
      let!(:transaction_type) { create(:transaction_type, name: 'transfer') }
      it "returns a not funds error on transfer transaction" do
        expect { bank_transaction }.to raise_error(BankTransactionService::NotEnoughFundsError)
      end
    end

    context "when we have a 100 withdraw with enough funds" do
      let!(:transaction_type) { create(:transaction_type, name: 'withdraw') }
      let!(:bank_account) { create(:bank_account, balance: 1000.0) }
      let(:params) do
        {
          amount: 100.0,
          transaction_type: transaction_type,
          origin_bank_account: bank_account,
          destination_bank_account: bank_account
        }
      end
      it "complete the withdraw successfully" do
        expect(bank_transaction).to be_truthy
      end
    end

    context "when we have a 100 transfer with enough funds" do
      let!(:transaction_type) { create(:transaction_type, name: 'transfer') }
      let!(:bank_account) { create(:bank_account, balance: 1000.0) }

      let(:params) do
        {
          amount: 100.0,
          transaction_type: transaction_type,
          origin_bank_account: bank_account,
          destination_bank_account: destination_bank_account
        }
      end
      it "complete the transfer successfully" do
        expect(bank_transaction).to be_truthy
      end
    end
  end
end
