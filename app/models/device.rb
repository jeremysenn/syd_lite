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
    end  end
  
  def bin_5
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 5, cassette_id: 5)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  end
  
  def bin_6
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 6, cassette_id: 6)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  end
  
  def bin_7
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 7, cassette_id: 7)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  end
  
  def bin_8
    bill_counts = BillCount.where(dev_id: id, cassette_nbr: 8, cassette_id: 8)
    unless bill_counts.blank?
      bill_counts.take.host_start_count - bill_counts.take.host_cycle_count
    else
      return nil
    end  end
end