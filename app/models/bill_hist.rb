class BillHist < ActiveRecord::Base
  self.primary_key = 'old_start'
  self.table_name= 'bill_hist'
  
  belongs_to :device, :foreign_key => 'dev_id'
  
  #############################
  #     Instance Methods      #
  #############################
  
  #############################
  #     Class Methods      #
  #############################
  
  def self.old_start_total(cut_date)
    old_start_total = 0
    bill_hists = BillHist.where(cut_dt: cut_date)
    bill_hists.each do |bill_hist|
      old_start_total += (bill_hist.old_start * bill_hist.denomination)
    end
    return old_start_total
  end
  
  def self.new_start_total(cut_date)
    new_start_total = 0
    bill_hists = BillHist.where(cut_dt: cut_date)
    bill_hists.each do |bill_hist|
      new_start_total += (bill_hist.new_start * bill_hist.denomination)
    end
    return new_start_total
  end
  
  def self.terminal_bill_dispensed(cut_date)
    terminal_bill_dispensed = 0
    bill_hists = BillHist.where(cut_dt: cut_date)
    bill_hists.each do |bill_hist|
      terminal_bill_dispensed += (bill_hist.old_term_cyc * bill_hist.denomination)
    end
    return terminal_bill_dispensed
  end
  
  def self.host_bill_dispensed(cut_date)
    host_bill_dispensed = 0
    bill_hists = BillHist.where(cut_dt: cut_date)
    bill_hists.each do |bill_hist|
      host_bill_dispensed += (bill_hist.old_host_cyc * bill_hist.denomination)
    end
    return host_bill_dispensed
  end
  
  def self.added(cut_date)
    added = 0
    bill_hists = BillHist.where(cut_dt: cut_date)
    bill_hists.each do |bill_hist|
      added += (bill_hist.added * bill_hist.denomination)
    end
    return added
  end
end