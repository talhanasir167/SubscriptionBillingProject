# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_510_145_602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.uuid 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'billings', force: :cascade do |t|
    t.integer 'plan_price'
    t.integer 'extra_usage_price'
    t.integer 'total_amount'
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_billings_on_user_id'
  end

  create_table 'features', force: :cascade do |t|
    t.string 'feature_name', null: false
    t.string 'feature_code'
    t.integer 'feature_unit_price', null: false
    t.integer 'feature_max_unit_limit', null: false
    t.bigint 'plan_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['feature_code'], name: 'index_features_on_feature_code', unique: true
    t.index ['feature_name'], name: 'index_features_on_feature_name', unique: true
    t.index ['plan_id'], name: 'index_features_on_plan_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.string 'plan_name', null: false
    t.integer 'monthly_fee', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['plan_name'], name: 'index_plans_on_plan_name', unique: true
  end

  create_table 'records', force: :cascade do |t|
    t.integer 'total_payement'
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_records_on_user_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'plan_id', null: false
    t.integer 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_subscriptions_on_deleted_at'
    t.index ['plan_id'], name: 'index_subscriptions_on_plan_id'
    t.index ['user_id'], name: 'index_subscriptions_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'usage_features', force: :cascade do |t|
    t.bigint 'subscription_id', null: false
    t.bigint 'feature_id', null: false
    t.integer 'usage'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'unit_usage_price'
    t.string 'extra_usage_price'
    t.index ['feature_id'], name: 'index_usage_features_on_feature_id'
    t.index ['subscription_id'], name: 'index_usage_features_on_subscription_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'role'
    t.string 'name', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'subscriptions', 'plans'
  add_foreign_key 'subscriptions', 'users'
  add_foreign_key 'usage_features', 'features'
  add_foreign_key 'usage_features', 'subscriptions'
end
