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
  erb(:index)
end


post '/my-money' do
  merchant = Merchant.new(params)
  merchant.save()
  merchant_id = Merchant.find_id_by_name(params['merchant_name'])
  params['merchant_id'] = merchant_id
  transaction = Transaction.new(params)
  transaction.save()
  redirect to '/my-money'
end
