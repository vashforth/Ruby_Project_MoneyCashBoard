require_relative('models/merchants.rb')
require_relative('models/tags.rb')
require_relative('models/transactions.rb')
require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')



get '/my-money' do
  @transactions = Transaction.show_all()
  @tags = Tag.show_all()
  @merchants = Merchant.show_all()
  @total = Transaction.sum_all()
  @budget = 1000
  erb(:index)
end


post '/my-money' do
  merchant = Merchant.new(params)
  merchant.save()
  params['merchant_id'] = merchant.id
  transaction = Transaction.new(params)
  transaction.save()
  redirect to '/my-money'
end


post '/my-money/:id/delete' do
  Transaction.delete_by_id(params[:id])
  redirect to '/my-money'
end

post '/my-money/delete-all' do
  Transaction.delete_all()
  redirect to '/my-money'
end
