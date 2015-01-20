class Device < ActiveRecord::Base
  self.primary_key = 'dev_id'
  
  def bin_1
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 1, cassette_id: 1)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_2
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 2, cassette_id: 2)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_3
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 3, cassette_id: 3)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end
  end
  
  def bin_4
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 4, cassette_id: 4)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  
  end
  
  def bin_5
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 5, cassette_id: 5)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  
  end
  
  def bin_6
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 6, cassette_id: 6)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  
  end
  
  def bin_7
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 7, cassette_id: 7)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  
  end
  
  def bin_8
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 8, cassette_id: 8)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  
  end
  
  def bin_1_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 1, cassette_id: 1)
    if denominations.blank? or bin_1.blank?
      return 0
    else
      return bin_1 * denominations.take.denomination
    end
  end
  
  def bin_2_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 2, cassette_id: 2)
    if denominations.blank? or bin_2.blank?
      return 0
    else
      return bin_2 * denominations.take.denomination
    end
  end
  
  def bin_3_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 3, cassette_id: 3)
    if denominations.blank? or bin_3.blank?
      return 0
    else
      return bin_3 * denominations.take.denomination
    end
  end
  
  def bin_4_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 4, cassette_id: 4)
    if denominations.blank? or bin_4.blank?
      return 0
    else
      return bin_4 * denominations.take.denomination
    end
  end
  
  def bin_5_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 5, cassette_id: 5)
    if denominations.blank? or bin_5.blank?
      return 0
    else
      return bin_5 * denominations.take.denomination
    end
  end
  
  def bin_6_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 6, cassette_id: 6)
    if denominations.blank? or bin_6.blank?
      return 0
    else
      return bin_6 * denominations.take.denomination
    end
  end
  
  def bin_7_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 7, cassette_id: 7)
    if denominations.blank? or bin_7.blank?
      return 0
    else
      return bin_7 * denominations.take.denomination
    end
  end
  
  def bin_8_remaining
    denominations = Denom.where(dev_id: id, cassette_nbr: 8, cassette_id: 8)
    if denominations.blank? or bin_8.blank?
      return 0
    else
      return bin_8 * denominations.take.denomination
    end
  end
  
  def remaining
    return bin_1_remaining + bin_2_remaining + bin_3_remaining + bin_4_remaining + bin_5_remaining + bin_6_remaining + bin_7_remaining + bin_8_remaining
  end
end