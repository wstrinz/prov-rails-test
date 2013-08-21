# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130821174500) do

  create_table "activities", :force => true do |t|
    t.string   "subject"
    t.string   "label"
    t.string   "generated"
    t.string   "used"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "agents", :force => true do |t|
    t.string   "actedOnBehalfOf"
    t.string   "label"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "associations", :force => true do |t|
    t.string   "label"
    t.string   "agent"
    t.string   "hadPlan"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "datasets", :force => true do |t|
    t.string   "label"
    t.string   "structure"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "datastructuredefinitions", :force => true do |t|
    t.string   "component"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entities", :force => true do |t|
    t.string   "subject"
    t.string   "wasGeneratedBy"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
