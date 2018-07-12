# encoding: UTF-8

require 'rails_helper'

describe 'Felhasználók', type: :feature, js: true do
  describe 'létrehozás' do
    before :each do
      visit '/'
    end

    describe 'sikeres' do
      it '1' do
        find('input[ng-model="user.name"]').set 'Felhasználó név'
        find('input[ng-model="user.birth_date"]').set '1979-12-20'
        find('button', text: '+').click
        find('input[ng-model="email.email"]').set 'abc@cde.hu'
        find('button', text: 'Mentés').click
        expect(page).to have_selector('tr td', text: 'Felhasználó név')
      end
    end

    describe 'sikertelen' do
      it 'birth_date' do
        find('input[ng-model="user.name"]').set 'Felhasználó név'
        find('button', text: 'Mentés').click
        wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
        alert = wait.until { page.driver.browser.switch_to.alert }
        alert.accept
        expect(page).to have_selector('pre', text: 'birth_date')
      end
    end
  end

  describe 'törlés' do
    before :each do
      Rake::Task['db:seed'].execute
      visit '/'
    end

    it 'sikeres' do
      expect(page).to have_selector('div[pager]', text: 'Összesen: 60')
      expect(page).to have_selector('tr td', text: 'Brendon Ford')
      find(:xpath, '//td[text()="Brendon Ford"]/../td/button').click
      expect(page).not_to have_selector('tr td', text: 'Brendon Ford')
    end
  end

  describe 'listázás' do
    before :each do
      Rake::Task['db:seed'].execute
      visit '/'
    end

    it 'lapozás' do
      expect(page).to have_selector('div[pager]', text: 'Összesen: 60')
      expect(page).to have_selector('tr td', text: 'Brendon Ford')
      find('button', text: '2').click
      expect(page).not_to have_selector('tr td', text: 'Brendon Ford')
      expect(page).to have_selector('tr td', text: 'Della Couch')
    end
  end
end
