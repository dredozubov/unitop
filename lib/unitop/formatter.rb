# encoding: utf-8

module Unitop
  module Formatter

    DEFAULT_FIELDS = [:pid, :pctcpu, :rtime, :comm]
    COLUMN_WIDTH = 15

    def spit processes, fields=nil
      fields ||= DEFAULT_FIELDS
      puts fields.inject("") { |acc, field|  acc + "%#{COLUMN_WIDTH}s" } % fields
      processes.each do |proc|
        kv = {}
        fields.each { |f| kv[f] = proc.send(f) rescue nil }
        puts fields.inject("") { |acc, field| acc + "%#{COLUMN_WIDTH}{#{field}}" } % kv
      end
    end

    def format_header fields
      fields ||= DEFAULT_FIELDS
      fields.map(&:upcase)
    end

    def format_proc proc, fields=nil
      fields ||= DEFAULT_FIELDS
      fields.map { |field| proc.send(field) }
    end
  end
end
