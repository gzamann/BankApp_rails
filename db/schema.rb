# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_181_004_142_454) do
  create_table 'accounts', force: :cascade do |t|
    t.float 'balance'
    t.string 'a_type'
    t.integer 'number'
    t.integer 'client_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_accounts_on_client_id'
  end

  create_table 'branches', force: :cascade do |t|
    t.string 'ifsc'
    t.integer 'number'
    t.string 'street'
    t.string 'city'
    t.string 'state'
    t.string 'pincode'
    t.string 'address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'cards', force: :cascade do |t|
    t.string 'card_type'
    t.integer 'number'
    t.integer 'cvv'
    t.integer 'pass'
    t.datetime 'date_of_issue'
    t.datetime 'date_of_expiry'
    t.integer 'account_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['account_id'], name: 'index_cards_on_account_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.integer 'age'
    t.integer 'number'
    t.string 'email'
    t.string 'pan'
    t.string 'street'
    t.string 'city'
    t.string 'state'
    t.string 'pincode'
    t.string 'address'
    t.date 'dob'
    t.integer 'branch_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['branch_id'], name: 'index_clients_on_branch_id'
  end

  create_table 'loans', force: :cascade do |t|
    t.string 'loan_type'
    t.integer 'amount'
    t.integer 'months'
    t.float 'rate'
    t.datetime 'time_of_issue'
    t.datetime 'end_of_loan'
    t.integer 'client_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_loans_on_client_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.string 't_type'
    t.integer 'amount'
    t.integer 'account_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['account_id'], name: 'index_transactions_on_account_id'
  end
end
