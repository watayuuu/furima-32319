require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context "商品出品ができデータが保存できる場合" do
      it "すべての項目が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品ができない場合" do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameの入力がないと登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "commentaryの入力がないと登録できない" do
        @item.commentary = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Commentary can't be blank")
      end
      it "category_idの入力がないと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "status_idの入力がないと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it "fee_idの入力がないと登録できない" do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank", "Fee is not a number")
      end
      it "area_idの入力がないと登録できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it "deliverydate_idの入力がないと登録できない" do
        @item.deliverydate_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydate can't be blank", "Deliverydate is not a number")
      end
      it "priceの入力がないと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it "priceが半角数字以外では登録できない" do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300以下では登録できない" do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
        
      it "priceが9999999以上では登録できない" do
        @item.price = '10000000000000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end


    end

    
  end
end
