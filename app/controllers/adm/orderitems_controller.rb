class Adm::OrderitemsController < ApplicationController

  def index
    @orderitems = Orderitem.all
  end
end