class InvoicesController < ApplicationController

  def show
    @invoice = Invoice.find_by(params[:id])
  end

  def upload
    if params[:invoice_upload][:datafile] && params[:invoice_upload][:datafile].content_type == 'text/csv'
      invoice = Invoice.create(name: params[:invoice_upload][:datafile].original_filename, file: params[:invoice_upload][:datafile])
      invoice.parse_csv(params[:invoice_upload][:datafile])
      redirect_to home_index_path(invoice: invoice)
    else
      flash[:error] = 'CSV file must be provided'
      redirect_back fallback_location: root_path
    end
  end
end