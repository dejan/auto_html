ActiveRecord::Schema.define(:version => Time.now.to_i) do
  create_table "articles", :force => true do |t|
    t.column "title",         :string
    t.column "body",          :text
    t.column "body_html",     :text
    t.column "created_at",    :datetime
    t.column "updated_at",    :datetime
  end

  create_table "users", :force => true do |t|
    t.column "name",         :string
    t.column "bio",          :text
  end
  
  create_table "posts", :force => true do |t|
    t.column "topic_id",     :integer
    t.column "user_id",      :integer
    t.column "content",      :text
  end
end
