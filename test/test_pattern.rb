require "#{File.dirname(__FILE__)}/helpers.rb"

class TPattern < TC
  def test_create
    p1 = 'x'.r
    asp 'x', p1
    p1 = 'abc'.r
    asp 'abc', p1
    
    asr do
      p1.eof.parse! 'abcd'
    end
    ase INVALID, p1.eof.parse('abcd')
    
    asr do 
      p1.eof.parse! 'xabc'
    end
    ase INVALID, p1.eof.parse('xabc')

    # with map block
    p = 'x'.r{ 'y' }
    ase INVALID, p.parse('y')
    ase 'y', p.parse('x')
  end

  def test_skip
    p = 'ef'.r.skip
    ase SKIP, p.parse('ef')
    ase INVALID, p.parse('bb')

    p = 'f'.r.skip
    ase SKIP, p.parse('f')
    ase INVALID, p.parse('x')

    # with map block
    p = 'f'.r.skip{ 'c' }
    ase 'c', p.parse('f')
  end

  def test_until
    p = 'ef'.r.until
    asp 'xef', p
    asp "x\nef", p
    
    p = 'e'.r.until
    asp 'xe', p
    asp "x\ne", p

    # with map block
    p = 'e'.r.until{|s| s*2}
    ase 'xexe', p.parse('xe')
  end

  def test_skip_until
    p = /\d\w+\d/.r.until.skip
    ase SKIP, p.parse("bcd\n3vve4")
    ase INVALID, p.eof.parse("bcd\n3vve4-")

    # with map block
    p = /\d\w+\d/.r.until.skip{'good'}
    ase 'good', p.parse("bcd\n3vve4")
    ase INVALID, p.eof.parse("bcd\n3vve4-")
  end
end
