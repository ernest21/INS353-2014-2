class TriangleError < RuntimeError
end

class Triangle
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
   raise TypeError unless a.is_a? Numeric and b.is_a? Numeric and c.is_a? Numeric
  end

  def kind
    raise TriangleError if illegal?
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  private

  def sides
    @sides ||= [a,b,c]
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end

  def illegal?
    violates_inequality? or impossible_length_side?
  end

  def violates_inequality?
    a+b <= c or b+c <= a or c+b <= b
  end

  def impossible_length_side?
    sides.any? {|side| side <= 0 }
  end
end

describe Triangle do
  before { @triangle = Triangle.new 5,4,5 }

  subject { @triangle}
  it { should respond_to(:kind, :a, :b, :c)}
  it { should_not respond_to(:sides, :equilateral, :isosceles, :illegal,:violates_inequality, :impossible_length_side) }

  context "with incorrect params" do
    it "should throw an error" do
      expect {Triangle.new(6,8,16)}.to raise_error TriangleError
      expect {Triangle.new(6,-9,0)}.to raise_error TriangleError
    end
  end

  describe "#kind" do
    context "with correct params" do
      it "should be true" do
        expect(Triangle.new(50,50,50).kind).to eql(:equilateral)
        expect(Triangle.new(50,30,50).kind).to eql(:isosceles)
        expect(Triangle.new(50,40,30).kind).to eql(:scalene)
      end
    end
  end
end