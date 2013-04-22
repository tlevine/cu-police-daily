#!/usr/bin/env python2
import os
from collections import OrderedDict

from lxml.html import parse

def main():
    for repid in os.listdir('downloads'):
        html = parse(os.path.join('downloads', repid))
        big_table, small_table = html.xpath('//table')
        print list(parse_big_table(big_table))
        print list(parse_small_table(small_table))

def parse_big_table(table):
    def unhtml(table):
        header = [td.text_content().strip() for td in table.xpath('tr[position()=1]/td')]
        for tr in table.xpath('tr[position()>1]'):
            yield OrderedDict(zip(header, [td.text_content().strip() for td in tr.xpath('td')]))

    for row in unhtml(table):
        yield row

def parse_small_table(table):
    def unhtml(table):
        for tr in table.xpath('tr'):
            yield tuple([td.text_content().strip() for td in tr.xpath('td')])

    return OrderedDict(unhtml(table))

if __name__ == '__main__':
    main()
