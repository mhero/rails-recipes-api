require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  # Test suite for GET /todos
  describe 'GET /searches' do
    # make HTTP get request before each example
    before { get '/searches' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /searches with params' do
    # make HTTP get request before each example
    before { get '/searches?keyword=mangue' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /searches with params with inavldi pagination !' do
    # make HTTP get request before each example
    before { get '/searches?keyword=mangue&page=!' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /searches with params with pagination 1' do
    # make HTTP get request before each example
    before { get '/searches?keyword=mangue&page=2' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /searches with params with pagination 2' do
    # make HTTP get request before each example
    before { get '/searches?keyword=mangue&page=2' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(25)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /searches with params with pagination 3' do
    # make HTTP get request before each example
    before { get '/searches?keyword=mangue&page=3' }

    it 'returns searches when there is no filter' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(22)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
