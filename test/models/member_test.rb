# -*- coding: utf-8 -*-
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "it needs a name" do
    member = Member.new
    assert_not member.valid?
    assert_equal ["can't be blank"], member.errors[:name]
  end

  test "it can attend meetups" do
    ferdinand = Member.create(name: "Ferdinand")
    ferdinand.attend(7)

    assert_equal 1, ferdinand.participations.count
    assert ferdinand.attends?(7)
    assert_equal [7], ferdinand.participations.map(&:meetup_id)
  end

  test "attending a meeting where you already attend does not crash" do
    ferdinand = Member.create(name: "Ferdinand")
    ferdinand.attend(7)
    ferdinand.attend(7) # does not raise an exception
  end

  test "can cancel a participation in a meetup" do
    ferdinand = Member.create(name: "Ferdinand")
    ferdinand.attend(8)

    assert ferdinand.attends?(8)
    ferdinand.cancel(8)
    assert_not ferdinand.attends?(8)
  end

  test "can be created from github's user data" do
    data = {
            "id" => 2384,
            "login" => "danielpuglisi",
            "name" => "Daniel Puglisi",
            "email" => "daniel.puglisi@gmx.net",
           }
    token = "asjd23akjdh191hd938h8hf84"
    member = Member.from_github_data(token, data)

    assert_not member.new_record?
    assert_equal 2384, member.github_id
    assert_equal "danielpuglisi", member.github_login
    assert_equal "Daniel Puglisi", member.name
    assert_equal "daniel.puglisi@gmx.net", member.email
    assert_equal token, member.github_oauth_token
  end

  test "can be created when no name is specified on github" do
    data = {
            "id" => 2384,
            "login" => "danielpuglisi",
            "email" => "daniel.puglisi@gmx.net",
           }
    token = "asjd23akjdh191hd938h8hf84"
    member = Member.from_github_data(token, data)

    assert_not member.new_record?
    assert_equal "danielpuglisi", member.github_login
    assert_equal "danielpuglisi", member.name
  end

  test "does not create duplicate users" do
    Member.create(name: "Rodrigo", github_id: 378)

    data = {
            "id" => 378,
            "login" => "therod",
            "name" => "Rodrigo Hänggi",
            "email" => "therod@codegestalt"
           }
    token = "asjd23akjdh191hd938h8hf84"
    member = Member.from_github_data(token, data)
    assert_not member.new_record?
    assert_equal 1, Member.count
  end
end
