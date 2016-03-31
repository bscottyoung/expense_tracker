# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
transactions=Transaction.create([
	{amt: '10.00', desc:'top off tank', tdate:'12012015', taxable_flag:'true', expense_id:'1', exp_group_id:'1', vendor_id:'1'}])
vendors=Vendor.create([
	{name:'Texaco'}])
expenses=Expense.create([
	{name:'gas', exp_group_id:'1'}])
exp_groups=ExpGroup.create([
	{name:'Auto Expenses'}])
