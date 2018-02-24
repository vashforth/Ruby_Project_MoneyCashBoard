require_relative('models/merchants.rb')
require_relative('models/tags.rb')
require_relative('models/transactions.rb')
require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')



get '/my-money/new' do
  @transactions = Transaction.show_all()
  @tags = Tag.show_all()
  @merchants = Merchant.show_all()
  @total = Transaction.sum_all()
  erb(:new)
end

get '/my-money/:tag_id' do
  @total_by_tag = Transaction.sum_by_tag(:tag_id)
  @transactions = Transaction.show_all()
  @total = Transaction.sum_all()
  erb(:show)
end

get '/my-money' do
  @transactions = Transaction.show_all()
  @tags = Tag.show_all()
  @merchants = Merchant.show_all()
  @total = Transaction.sum_all()
  erb(:index)
end

post '/my-money' do
  @transactions = Transaction.show_all()
  @tags = Tag.show_all()
  @merchants = Merchant.show_all()
  @total = Transaction.sum_all()
  transaction = Transaction.new(params)
  transaction.save()
  redirect to '/my-money/new'
end
