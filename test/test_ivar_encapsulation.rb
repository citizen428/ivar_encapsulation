require 'minitest/autorun'
require 'ivar_encapsulation'

class TestIvarEncapsulation < MiniTest::Unit::TestCase
  class Foo
    attribute :private
    attribute :public_reader, getter: true
    attribute :public_writer, setter: true
    attribute :public_reader_writer, getter: true, setter: true
    attributes :foo, :bar, :baz

    def initialize
      self.private = :priv
      self.public_reader = :pr
      self.public_writer = :pw
      self.public_reader_writer = :prw
    end
  end

  def setup
    @f = Foo.new
  end

  def test_private
    assert @f.private_methods.include? :private
    assert @f.private_methods.include? :private=
  end

  def test_public_reader
    assert @f.methods.include? :public_reader
    assert @f.private_methods.include? :public_reader=
    assert @f.public_reader == :pr
  end

  def test_public_writer
    assert @f.private_methods.include? :public_writer
    assert @f.methods.include? :public_writer=
    @f.public_writer = :changed
    assert @f.instance_variable_get("@public_writer") == :changed
  end

  def test_public_reader_writer
    assert @f.methods.include? :public_reader_writer
    assert @f.methods.include? :public_reader_writer=
    assert @f.public_reader_writer == :prw
    assert @f.public_reader_writer = :changed
    assert @f.public_reader_writer == :changed
  end

  def test_aliased_method_name
    assert (@f.private_methods & [:foo, :bar, :baz]).size == 3
    assert (@f.private_methods & [:foo=, :bar=, :baz=]).size == 3
  end

end
