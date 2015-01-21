class Device < ActiveRecord::Base
  self.primary_key = 'dev_id'
  
  def bin_1
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 1)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_2
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 2)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_3
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 3)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_4
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 4)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_5
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 5)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_6
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 6)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_7
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 7)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_8
    bill_count = BillCount.find_by_dev_id_and_cassette_id(id, 8)
    unless bill_count.blank?
      bill_count.host_start_count - bill_count.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_1_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 1)
    if denom.blank? or bin_1.blank?
      return 0
    else
      return bin_1 * denom.denomination
    end
  end
  
  def bin_2_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 2)
    if denom.blank? or bin_2.blank?
      return 0
    else
      return bin_2 * denom.denomination
    end
  end
  
  def bin_3_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 3)
    if denom.blank? or bin_3.blank?
      return 0
    else
      return bin_3 * denom.denomination
    end
  end
  
  def bin_4_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 4)
    if denom.blank? or bin_4.blank?
      return 0
    else
      return bin_4 * denom.denomination
    end
  end
  
  def bin_5_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 5)
    if denom.blank? or bin_5.blank?
      return 0
    else
      return bin_5 * denom.denomination
    end
  end
  
  def bin_6_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 6)
    if denom.blank? or bin_6.blank?
      return 0
    else
      return bin_6 * denom.denomination
    end
  end
  
  def bin_7_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 7)
    if denom.blank? or bin_7.blank?
      return 0
    else
      return bin_7 * denom.denomination
    end
  end
  
  def bin_8_remaining
    denom = Denom.find_by_dev_id_and_cassette_id(id, 8)
    if denom.blank? or bin_8.blank?
      return 0
    else
      return bin_8 * denom.denomination
    end
  end
  
  def remaining
    return bin_1_remaining + bin_2_remaining + bin_3_remaining + bin_4_remaining + bin_5_remaining + bin_6_remaining + bin_7_remaining + bin_8_remaining
  end
end