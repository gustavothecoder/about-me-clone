require 'rails_helper'

RSpec.describe UserPageDesign, type: :model do
  before(:all) do
    @design = Design.new(design_type: "small design")
    @design.save
    @color = Color.new(color: 'blue')
    @color.save
    @reason = Reason.new(reason: 'download my app')
    @reason.save
    @user = User.new(username: 'gXh',email: 'gustavo@gmail.com',password: '123456',first_name: 'Gustavo',last_name: 'Ribeiro',location: 'Piracicaba - SP',reason_id: @reason.id )
    @user.save
    @user_page_design = UserPageDesign.new(user: @user, design: @design, color: @color)
  end

  after(:all) do
    @design.destroy
    @color.destroy
    @user.destroy
    @reason.destroy
    @user_page_design.destroy
  end

  it 'Must be a UserPageDesign instance' do
    expect(@user_page_design).to be_instance_of UserPageDesign
  end

  it 'Must be successfully registered' do
    expect(@user_page_design.save).to be true
  end

  context 'Registered data' do
    it 'Must be the registered user' do
      expect(@user_page_design.user).to eq @user
    end

    it 'Must be the registered design' do
      expect(@user_page_design.design).to eq @design
    end

    it 'Must be the registered color' do
      expect(@user_page_design.color).to eq @color
    end
  end

  context 'Relationship tests' do
    before(:all) do
      @user_page_design.save
      @second_user = User.new(
        username: 'gXhr',
        email: 'gustavoh@gmail.com',
        password: '123456',
        first_name: 'Gustavo',
        last_name: 'Ribeiro',
        location: 'Piracicaba - SP',
        reason_id: @reason.id
      )
      @second_user.save
      @second_user_page_design = UserPageDesign.new(user: @second_user, design: @design, color: @color)
      @second_user_page_design.save
    end

    after(:all) do
      @second_user.destroy
      @second_user_page_design.destroy
    end

    it '#1 There must be a relationship with a user' do
      expect(@color.users.empty?).to be false
    end

    it '#1 Must have two users' do
      expect(@color.users.length).to eq 2
    end

    it '#1 Must be equal to @user' do
      expect(@color.users[0]).to eq @user
    end

    it '#1 Must be equal to @second_user' do
      expect(@color.users[1]).to eq @second_user
    end

    it '#2 There must be a relationship with a user' do
      expect(@design.users.empty?).to be false
    end

    it '#2 Must have two users' do
      expect(@design.users.length).to eq 2
    end

    it '#2 Must be equal to @user' do
      expect(@design.users[0]).to eq @user
    end

    it '#2 Must be equal to @second_user' do
      expect(@design.users[1]).to eq @second_user
    end

    it '#1 Must have a color' do
      expect(@user.color).to eq @color
    end

    it '#1 Must have a design' do
      expect(@user.design).to eq @design
    end

    it '#1 Must have a user page design' do
      expect(@user.user_page_design).to eq @user_page_design
    end

    it '#2 Must have a color' do
      expect(@second_user.color).to eq @color
    end

    it '#2 Must have a design' do
      expect(@second_user.design).to eq @design
    end

    it '#2 Must have a user page design' do
      expect(@second_user.user_page_design).to eq @second_user_page_design
    end
  end

  context 'Invalid records' do
    it '#1 Must not be registered' do
      third_user_page_design = UserPageDesign.new
      expect(third_user_page_design.save).to be false
    end

    it '#2 Must not be registered' do
      third_user_page_design = UserPageDesign.new(user: @user)
      expect(third_user_page_design.save).to be false
    end

    it '#3 Must not be registered' do
      third_user_page_design = UserPageDesign.new(design: @design)
      expect(third_user_page_design.save).to be false
    end

    it '#4 Must not be registered' do
      third_user_page_design = UserPageDesign.new(color: @color)
      expect(third_user_page_design.save).to be false
    end

    it '#5 Must not be registered' do
      third_user_page_design = UserPageDesign.new(user: @user, design: @design)
      expect(third_user_page_design.save).to be false
    end

    it '#6 Must not be registered' do
      @user_page_design.save
      third_user_page_design = UserPageDesign.new(user: @user, design: @design, color: @color)
      expect(third_user_page_design.save).to be false
    end
  end
end
