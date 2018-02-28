require_relative('../models/merchants')
require_relative('../models/tags')
require_relative('../models/transactions')
require_relative('../models/budget')
require('pry-byebug')
require('titleize')

Budget.delete_all()
Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


merchant1 = Merchant.new({"merchant_name" => "tesco"})
merchant2 = Merchant.new({"merchant_name" => "h & m"})
merchant3 = Merchant.new({"merchant_name" => "pizza express"})
merchant4 = Merchant.new({"merchant_name" => "holland and barrett"})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

tag1 = Tag.new({"tag_name" => "Food"})
tag2 = Tag.new({"tag_name" => "Eating Out"})
tag3 = Tag.new({"tag_name" => "Clothes"})
tag4 = Tag.new({"tag_name" => "Transport"})
tag5 = Tag.new({"tag_name" => "Entertainment"})
tag6 = Tag.new({"tag_name" => "Travel"})
tag7 = Tag.new({"tag_name" => "Repairs"})

tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()

transaction1 = Transaction.new({"amount" => 34.50, "merchant_id" => merchant3.id(), "tag_id" => tag4.id(), "trans_date" => '2018-01-30'})
transaction2 = Transaction.new({"amount" => 7.95, "merchant_id" => merchant4.id(), "tag_id" => tag1.id(), "trans_date" => '2018-02-09'})
transaction3 = Transaction.new({"amount" => 60.20, "merchant_id" => merchant2.id(), "tag_id" => tag3.id(), "trans_date" => '2018-03-19'})
transaction4 = Transaction.new({"amount" => 12.79, "merchant_id" => merchant1.id(), "tag_id" => tag1.id(), "trans_date" => '2018-11-01'})
transaction5 = Transaction.new({"amount" => 15.45, "merchant_id" => merchant4.id(), "tag_id" => tag5.id(), "trans_date" => '2018-01-15'})
transaction6 = Transaction.new({"amount" => 34.50, "merchant_id" => merchant3.id(), "tag_id" => tag6.id(), "trans_date" => '2018-01-30'})
transaction7 = Transaction.new({"amount" => 7.95, "merchant_id" => merchant4.id(), "tag_id" => tag1.id(), "trans_date" => '2018-02-09'})
transaction8 = Transaction.new({"amount" => 60.20, "merchant_id" => merchant2.id(), "tag_id" => tag3.id(), "trans_date" => '2018-03-19'})
transaction9 = Transaction.new({"amount" => 12.79, "merchant_id" => merchant1.id(), "tag_id" => tag6.id(), "trans_date" => '2018-11-01'})
transaction10 = Transaction.new({"amount" => 15.45, "merchant_id" => merchant4.id(), "tag_id" => tag3.id(), "trans_date" => '2018-01-15'})
transaction11 = Transaction.new({"amount" => 34.50, "merchant_id" => merchant3.id(), "tag_id" => tag2.id(), "trans_date" => '2018-01-30'})
transaction12 = Transaction.new({"amount" => 7.95, "merchant_id" => merchant4.id(), "tag_id" => tag1.id(), "trans_date" => '2018-02-09'})
transaction13 = Transaction.new({"amount" => 60.20, "merchant_id" => merchant2.id(), "tag_id" => tag7.id(), "trans_date" => '2018-03-19'})
transaction14 = Transaction.new({"amount" => 12.79, "merchant_id" => merchant1.id(), "tag_id" => tag7.id(), "trans_date" => '2018-11-01'})
transaction15 = Transaction.new({"amount" => 15.45, "merchant_id" => merchant4.id(), "tag_id" => tag3.id(), "trans_date" => '2018-01-15'})



transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()
transaction11.save()
transaction12.save()
transaction13.save()
transaction14.save()
transaction15.save()

budget = Budget.new({"weekly" => 500.00, "monthly" => 2000.00, "yearly" => 24000.00})
budget.save()

binding.pry

nil
