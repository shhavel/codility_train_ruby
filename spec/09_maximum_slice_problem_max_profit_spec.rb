# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    len = a.length
    return 0 if len.zero?
    a2 = Array.new(len, 0)
    (1...len).each { |i| a2[i] = a[i] - a[i-1] }
    puts "a2 = #{a2.inspect}"
    cur_sum = 0 # current positive sum
    max_sum = 0 # maximum sum so far
    a2.each do |x|
      if x >= 0
        cur_sum += x
      else
        max_sum = [max_sum, cur_sum].max
        if cur_sum + x > 0
          cur_sum += x
        else
          cur_sum = 0
        end
      end
      puts "x = #{x}, cur_sum = #{cur_sum}, max_sum = #{max_sum}"
    end
    [cur_sum, max_sum, 0].max
  end

  it { expect(solution([23171, 21011, 21123, 21366, 21013, 21367])).to eq(356) }
end
