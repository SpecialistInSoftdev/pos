# _POS_

##### _Allows an employee to ring up a sale, allows a manager to view/edit inventory and see purchase history, 8/25/15_

#### By _**Andrew Dang | Shannon Mulloy**_

## Description

An employee can ring up a customer by selecting the name of a returning customer or adding a new one, putting items in that customer's cart, then hitting 'Complete Order.' The customer's cart empties and the order gets logged in 'purchase history,' viewable by the manager. The manager also has access to view, update and create new inventory (employees can view only available inventory when adding items to a customer's cart).

link to app on heroku: https://pos-register.herokuapp.com/

## Setup

* _Clone from GitHub_
* _Run: bundle_
* _Run: rake db:create_
* _Run: rake db:migrate_
* _Launch in Sinatra_

## Technologies Used

_Ruby, ActiveRecord_

### Legal

Copyright (c) 2015 **_Andrew Dang | Shannon Mulloy_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
