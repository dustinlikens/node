 def scrape 
  output = ""
  c = params[:discountCount].to_i
  (0...c).each do |i|
    agent = Mechanize.new
    page = agent.get('https://www.budget.com/budgetWeb/home/home.ex')
    form = page.form('reservationForm')
    form.field_with(name: 'pulDesc').value = "C7A"
    form.field_with(name: 'txtPUDate').value = params[:pickUpDate]
    form.field_with(name: 'txtDODate').value = params[:returnDate]
    form.field_with(name: 'discountNumber').value = params["discount#{i}".to_sym]
    page = form.submit
    output = page.body
  end
  output
end