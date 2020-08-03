class WorkOrderController < ApplicationController
  def index
    @work_orders = WorkOrder.all
    @technicians = Technician.all
    @locations = Location.all
  end
end
