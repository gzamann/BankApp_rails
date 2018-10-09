ActiveRecord::Schema.define(version: 2018_10_04_142454) do

  create_table "accounts", force: :cascade do |t|
    t.decimal "balance"
    t.string "a_type"
    t.integer "number"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "IFSC"
    t.string "address"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_type"
    t.integer "number"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_cards_on_account_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "number"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_clients_on_branch_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "loan_type"
    t.integer "amount"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_loans_on_client_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "t_type"
    t.integer "amount"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

end
