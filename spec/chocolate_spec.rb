require_relative '../lib/chocolate'

RSpec.describe "can_i_make_chocolate?" do
  it "returns true with cocoa_powder, cocoa_butter, and sugar" do
    expect(can_i_make_chocolate?(true, true, false, true, false)).to be true
  end

  it "returns true with cocoa_powder, cocoa_butter, and artificial_sweetener" do
    expect(can_i_make_chocolate?(true, true, false, false, true)).to be true
  end

  it "returns true with cocoa_powder, coconut_oil, and sugar"do
    expect(can_i_make_chocolate?(true, false, true, true, false)).to be true
  end

  it "returns true with cocoa_powder, coconut_oil, and artificial_sweetener"do
    expect(can_i_make_chocolate?(true, false, true, false, true)).to be true
  end

  it "returns false without cocoa_powder" do
    expect(can_i_make_chocolate?(false, true, true, true, true)).to be false
  end

  it "returns false without a fat" do
    expect(can_i_make_chocolate?(true, false, false, true, true)).to be false
  end

  it "returns false without a sweetener" do
    expect(can_i_make_chocolate?(true, true, true, false, false)).to be false
  end
end
