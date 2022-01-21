require_relative 'test_helper'

describe 'XIRR Tests' do
  before(:all) do
    data = []
    data << Finance::Transaction.new(  -310000.0,date: Time.parse('2017-04-03'))
    data << Finance::Transaction.new(        0.0,date: Time.parse('2017-04-03'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2017-06-03'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2017-06-03'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2017-07-03'))
    data << Finance::Transaction.new(    13100.0,date: Time.parse('2017-08-28'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2017-09-03'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2017-10-03'))
    data << Finance::Transaction.new(     3000.0,date: Time.parse('2017-11-09'))
    data << Finance::Transaction.new(     3000.0,date: Time.parse('2017-12-08'))
    data << Finance::Transaction.new(     3100.0,date: Time.parse('2018-01-02'))
    data << Finance::Transaction.new(     3500.0,date: Time.parse('2018-02-05'))
    data << Finance::Transaction.new(    13800.0,date: Time.parse('2018-03-07'))
    data << Finance::Transaction.new(     3987.5,date: Time.parse('2018-05-08'))
    data << Finance::Transaction.new(     3750.0,date: Time.parse('2018-06-01'))
    data << Finance::Transaction.new(     3750.0,date: Time.parse('2018-07-01'))
    data << Finance::Transaction.new(     6400.0,date: Time.parse('2018-07-11'))
    data << Finance::Transaction.new(     3625.0,date: Time.parse('2018-08-01'))
    data << Finance::Transaction.new(     3625.0,date: Time.parse('2018-09-07'))
    data << Finance::Transaction.new(     3625.0,date: Time.parse('2018-10-22'))
    data << Finance::Transaction.new(  306723.33,date: Time.parse('2019-01-18'))
    @data = data

    @data2 = []
    @data2 << Finance::Transaction.new(-10_000, date: Date.new(2008, 1, 1).to_time)
    @data2 << Finance::Transaction.new(2_750, date: Date.new(2008, 3, 1).to_time)
    @data2 << Finance::Transaction.new(4_250, date: Date.new(2008, 10, 30).to_time)
    @data2 << Finance::Transaction.new(3_250, date: Date.new(2009, 2, 15).to_time)
    @data2 << Finance::Transaction.new(2_750, date: Date.new(2009, 4, 1).to_time)
  end

  it 'Computes XIRR properly' do
    xirr = @data.xirr.apr
    # assert_equal(D('0.158225638'), xirr.round(9))
    assert_equal(D('0.1582'), xirr.round(4))
  end

  it 'Also computes XIRR' do
    xirr = @data2.xirr.apr
    exp = D('0.3734')
    assert_equal(exp, xirr.round(4))
  end

end
