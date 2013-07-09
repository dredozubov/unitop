# encoding: utf-8

#require 'unitop/formatter'

include Sys

module Unitop
  module Cli

    extend Unitop::Formatter

    class << self
      def valid_arity? command, arity
        method_arity = method(command).arity
        return true if method_arity == -1
        method_arity == arity
      end

      def command command, *args
        command = command.to_sym
        if respond_to?(command) && valid_arity?(command, args.size)
          send command, *args
        else
          # TODO: make it explicit about stuff
          error "no command or wrong arity"
        end
      end

      def error message
        $stderr.puts message
        exit 1
      end

      def list *args
        fields = if !args.empty?
          args.map(&:to_sym) 
        else
          nil
        end
        puts "fields: #{fields}"
        spit ProcTable.ps, fields
      end
      
      def filter by
        processes = ProcTable.ps.select do |proc|
          proc.comm.match /#{by}/i
        end
        spit processes
      end
    end
  end
end
