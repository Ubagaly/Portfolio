import scrapy


class Instagram2Spider(scrapy.Spider):
    name = 'instagram_2'
    allowed_domains = ['www.instagram.com']
    start_urls = ['http://www.instagram.com/']

    def parse(self, response):
        pass
