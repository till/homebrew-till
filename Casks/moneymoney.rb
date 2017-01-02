cask 'moneymoney' do
  version '2.2.15'
  sha256 'be09bf954c7253d160b68dc775a5084c51b2440e590c033a96db728e9b08c052'

  url 'https://service.moneymoney-app.com/1/MoneyMoney.zip'
  appcast 'https://service.moneymoney-app.com/1/Appcast.xml',
          checkpoint: 'fcdb0dab20cce8545360daaed1b47d85f67b25bcf2e7e3e87ea7618c3f6de337'
  name 'MoneyMoney'
  homepage 'https://moneymoney-app.com/'

  app 'MoneyMoney.app'
end
