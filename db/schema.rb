# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20_210_210_203_700) do
=======
ActiveRecord::Schema.define(version: 2021_06_28_014723) do

>>>>>>> cf572b7d8a368d094e866ce680c76a74dbe247e2
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

<<<<<<< HEAD
  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'status'
    t.string 'image_url'
    t.bigint 'category_id', null: false
    t.bigint 'user_id', null: false
    t.index ['category_id'], name: 'index_articles_on_category_id'
    t.index ['user_id'], name: 'index_articles_on_user_id'
=======
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "image_url"
    t.bigint "category_id"
    t.bigint "user_id", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
>>>>>>> cf572b7d8a368d094e866ce680c76a74dbe247e2
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'commenter'
    t.text 'body'
    t.bigint 'article_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'status'
    t.bigint 'user_id', null: false
    t.index ['article_id'], name: 'index_comments_on_article_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'follows', force: :cascade do |t|
    t.integer 'follower_id', null: false
    t.integer 'followed_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', null: false
    t.string 'password_digest', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'articles', 'categories'
  add_foreign_key 'articles', 'users'
  add_foreign_key 'comments', 'articles'
  add_foreign_key 'comments', 'users'
end
