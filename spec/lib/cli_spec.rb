# encoding: utf-8
require 'spec_helper'
require 'unitop/cli'

describe Unitop::Cli do
  describe '.valid_arity?' do
    context 'with .list method receiving splat *args' do
      it 'returns true for 1 argument' do 
        subject.valid_arity?(:list, 1).should be_true
      end

      it 'returns true for 10 arguments' do 
        subject.valid_arity?(:list, 10).should be_true
      end

      it 'returns true for no arguments' do
        subject.valid_arity?(:list, 0).should be_true
      end
    end

    context 'with .filter method receiving 1 argument' do
      it 'returns true for 1 argument' do 
        subject.valid_arity?(:filter, 1).should be_true
      end

      it 'returns false for 10 arguments' do 
        subject.valid_arity?(:filter, 10).should be_false
      end

      it 'returns false for no arguments' do
        subject.valid_arity?(:filter, 0).should be_false
      end

    end
  end

  describe '.command' do
    pending context 'with no arguments' do
      it 'exit gracefully with wrong command' do
        subject.command(:foobar).should exit_with_code(1)
      end
    end
  end
end
