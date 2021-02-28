import scrapy


class InstagrammSpider(scrapy.Spider):
    name = 'instagramm_'
    allowed_domains = ['www.instagram.com']
    start_urls = ['http://www.instagram.com/']

    def parse(self, response):
        pass
