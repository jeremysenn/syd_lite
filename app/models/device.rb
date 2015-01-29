class Device < ActiveRecord::Base
  self.primary_key = 'dev_id'
  
  #############################
  #     Instance Methods      #
  #############################
  
  def inactive?
    unless inactive_flag.blank?
      inactive_flag > 0
    else
      return false
    end
  end
  
  def bill_counts
    BillCount.where(dev_id: id)
  end
  
  def bill_hists
    BillHist.where(dev_id: id)
  end
  
  def cards
    Card.where(dev_id: id)
  end
  
  def dev_statuses
    DevStatus.where(dev_id: id)
  end
  
  def transactions
    Transaction.where(dev_id: id)
  end
  
  def denoms
    Denom.where(dev_id: id)
  end
  
  ### Start - bill_count records ###
  def bill_count_1
    BillCount.find_by_dev_id_and_cassette_id(id, 1)
  end
  
  def bill_count_2
    BillCount.find_by_dev_id_and_cassette_id(id, 2)
  end
  
  def bill_count_3
    BillCount.find_by_dev_id_and_cassette_id(id, 3)
  end
  
  def bill_count_4
    BillCount.find_by_dev_id_and_cassette_id(id, 4)
  end
  
  def bill_count_5
    BillCount.find_by_dev_id_and_cassette_id(id, 5)
  end
  
  def bill_count_6
    BillCount.find_by_dev_id_and_cassette_id(id, 6)
  end
  
  def bill_count_7
    BillCount.find_by_dev_id_and_cassette_id(id, 7)
  end
  
  def bill_count_8
    BillCount.find_by_dev_id_and_cassette_id(id, 8)
  end
  ### End - bill_count records ###
  
  def bin_1_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 1)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_2_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 2)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_3_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 3)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_4_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 4)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_5_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 5)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_6_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 6)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_7_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 7)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_8_count
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 8)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_1_remaining # Total dollar amount remaining in bin/cassette 1
    denom = Denom.find_by_dev_id_and_cassette_id(id, 1)
    if denom.blank? or bin_1_count.blank?
      return 0
    else
      return bin_1_count * denom.denomination
    end
  end
  
  def bin_2_remaining # Total dollar amount remaining in bin/cassette 2
    denom = Denom.find_by_dev_id_and_cassette_id(id, 2)
    if denom.blank? or bin_2_count.blank?
      return 0
    else
      return bin_2_count * denom.denomination
    end
  end
  
  def bin_3_remaining # Total dollar amount remaining in bin/cassette 3
    denom = Denom.find_by_dev_id_and_cassette_id(id, 3)
    if denom.blank? or bin_3_count.blank?
      return 0
    else
      return bin_3_count * denom.denomination
    end
  end
  
  def bin_4_remaining # Total dollar amount remaining in bin/cassette 4
    denom = Denom.find_by_dev_id_and_cassette_id(id, 4)
    if denom.blank? or bin_4_count.blank?
      return 0
    else
      return bin_4_count * denom.denomination
    end
  end
  
  def bin_5_remaining # Total dollar amount remaining in bin/cassette 5
    denom = Denom.find_by_dev_id_and_cassette_id(id, 5)
    if denom.blank? or bin_5_count.blank?
      return 0
    else
      return bin_5_count * denom.denomination
    end
  end
  
  def bin_6_remaining # Total dollar amount remaining in bin/cassette 6
    denom = Denom.find_by_dev_id_and_cassette_id(id, 6)
    if denom.blank? or bin_6_count.blank?
      return 0
    else
      return bin_6_count * denom.denomination
    end
  end
  
  def bin_7_remaining # Total dollar amount remaining in bin/cassette 7
    denom = Denom.find_by_dev_id_and_cassette_id(id, 7)
    if denom.blank? or bin_7_count.blank?
      return 0
    else
      return bin_7_count * denom.denomination
    end
  end
  
  def bin_8_remaining # Total dollar amount remaining in bin/cassette 8
    denom = Denom.find_by_dev_id_and_cassette_id(id, 8)
    if denom.blank? or bin_8_count.blank?
      return 0
    else
      return bin_8_count * denom.denomination
    end
  end
  
  def remaining # Total dollar amount remaining in this Device/ATM
    total = 0
    bill_counts.each do |bill_count|
      denoms.where(cassette_id: bill_count.cassette_id).each do |denom|
        total = total + (bill_count.count * denom.denomination)
      end
    end
    return total
#    return bin_1_remaining + bin_2_remaining + bin_3_remaining + bin_4_remaining + bin_5_remaining + bin_6_remaining + bin_7_remaining + bin_8_remaining
  end
  
  def transactions_date_span_search(start_date, end_date)
#    transactions.where("CreateDate" => start_date..end_date)
    transactions.where("CreateDate > ? AND CreateDate <= ?", start_date, end_date)
  end
  
  #############################
  #     Class Methods      #
  #############################
end