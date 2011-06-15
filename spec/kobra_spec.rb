require 'spec_helper'
require 'kobra'

describe Kobra::Client do
  describe '#get_student' do
    it 'obtains student information by email' do
      stub_request(:post, "http://john:a9b8c7@kobra.ks.liu.se/students/api.json").
        with(:body => "email=johdoXXX%40student.liu.se").
        to_return(fixture('student_found.txt'))
    
      kobra = Kobra::Client.new(:username => 'john', :api_key => 'a9b8c7')
      student = kobra.get_student(:email => 'johdoXXX@student.liu.se')
      
      student[:email].should           == 'johdoXXX@student.liu.se'
      student[:liu_id].should          == 'johdoXXX'
      student[:rfid_number].should     == '9999999999'
      student[:first_name].should      == 'JOHN'
      student[:last_name].should       == 'DOE'
      student[:blocked].should         == nil
      student[:barcode_number].should  == '888888888888888'
      student[:union].should           == 'LinTek'
      student[:personal_number].should == '887711-0011'
    end
    
    it 'failes to obtain student information by email' do
      stub_request(:post, "http://john:a9b8c7@kobra.ks.liu.se/students/api.json").
        with(:body => "email=johdoXXX%40student.liu.se").
        to_return(fixture('student_not_found.txt'))
    
      kobra = Kobra::Client.new(:username => 'john', :api_key => 'a9b8c7')
      expect { kobra.get_student(:email => 'johdoXXX@student.liu.se') }.to raise_error Kobra::Client::NotFound
    end
    
    it 'failes to authorize' do
      stub_request(:post, "http://john:wrong@kobra.ks.liu.se/students/api.json").
        with(:body => "email=johdoXXX%40student.liu.se").
        to_return(fixture('auth_failure.txt'))
    
      kobra = Kobra::Client.new(:username => 'john', :api_key => 'wrong')
      expect { kobra.get_student(:email => 'johdoXXX@student.liu.se') }.to raise_error Kobra::Client::AuthError
    end
    
    it 'gets garbage' do
      stub_request(:post, "http://john:a9b8c7@kobra.ks.liu.se/students/api.json").
        with(:body => "email=johdoXXX%40student.liu.se").
        to_return(fixture('garbage.txt'))
    
      kobra = Kobra::Client.new(:username => 'john', :api_key => 'a9b8c7')
      expect { kobra.get_student(:email => 'johdoXXX@student.liu.se') }.to raise_error Kobra::Client::BadResponse
    end
    
    it 'gets server error' do
      stub_request(:post, "http://john:a9b8c7@kobra.ks.liu.se/students/api.json").
        with(:body => "email=johdoXXX%40student.liu.se").
        to_return(fixture('server_error.txt'))
    
      kobra = Kobra::Client.new(:username => 'john', :api_key => 'a9b8c7')
      expect { kobra.get_student(:email => 'johdoXXX@student.liu.se') }.to raise_error Kobra::Client::ServerError
    end
  end
end