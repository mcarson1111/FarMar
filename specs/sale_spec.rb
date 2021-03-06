require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Sale do  
  it "will not be nil" do
    FarMar::Sale.wont_be_nil
  end
end


describe "Sale#all" do
  let(:all_sales){FarMar::Sale.all}

  it "makes an array of all the sales" do
    all_sales.wont_be_nil
  end
  it "returns an array" do
    all_sales.class.must_equal(Array)
  end
  it "makes sure that the first element is an instance of a Sale/Sale object" do
    all_sales.first.class.must_equal(FarMar::Sale)
  end

  it "returns an array full of FarMar::Sale instances" do
    classes = all_sales.map{ |s| s.class}
    classes.uniq.must_equal [FarMar::Sale]
  end
end


describe "Sale#find" do
  let(:sale) {FarMar::Sale.find(8)}

  it"makes sure that the id requested matches the id given" do
    sale = FarMar::Sale.find(8)
    sale.sale_id.must_equal("8")
  end

  it "knows data about the sale" do
    sale.sale_id.must_equal "8"
    sale.amount.must_equal "5727"
    sale.purchase_time.must_equal "2013-11-12 06:03:54 -0800"
    sale.vendor_id.must_equal "2"
    sale.product_id.must_equal "2"
  end
end


describe "Sale#vendor" do
let(:sale) {FarMar::Sale.find(32)}
  it "makes sure that when we call vendor method on the new instance of Sale we get the correct one" do
    sale.vendor.vendor_id.must_equal("7")
  end
end


describe "Sale#product" do
let(:sale) {FarMar::Sale.find(32)}
  it "makes sure that when we call product method on the new instance of Sale we get the correct one" do
    sale.product.product_id.must_equal("14")
  end
end


describe "Sale#self.between" do

  it "returns the number of sales made between the begin time and the end time" do
    start_time = "2013-11-11 06:44:12 -0800"
    end_time = "2013-11-11 06:44:14 -0800"
    total_sales = FarMar::Sale.between(start_time, end_time)
    total_sales.length.must_equal(1)



  end

end
