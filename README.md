[![Circle CI](https://circleci.com/gh/rackspace-cookbooks/user_shadow.svg?style=svg)](https://circleci.com/gh/rackspace-cookbooks/user_shadow)

# user_shadow

A cookbook to provide a LWRP for modifying user shadow attributes.

## Supported Platforms

* Centos 6.6
* Ubuntu 12.04
* Ubuntu 14.04

## Usage

Place a dependency on the user_shadow cookbook in your cookbook's metadata.rb
```
depends 'user_shadow'
```
Then, in your recipe
```
# myrecipe.rb
user_shadow 'testuser'
  sp_lstchg '2015-07-01'
  sp_expire '2030-08-30'
  sp_min 20
  sp_max 60
  sp_inact 10
  sp_warn 10
end
```
The user to modify is ```testuser```. See a full list of parameters and explanation below.


## Resource overview

The ```user_shadow``` LWRP modifies the shadow attributes of a user. There is only one action defined, ```:set``` which writes the new values on the corresponding attributes.

### Parameters

* ```user``` - String that denotes the user to be modified. Defaults to the name of the resource. 
* ```sp_lstchg``` - String that denotes the date when the user's password was last changed. Must be in YYYY-MM-DD format. No default.
* ```sp_expire``` - String that denotes the date when the account expires. Must be in YYYY-MM-DD format. No default.
* ```sp_min``` - Number that denotes the minimum number of days between password changes. No default.
* ```sp_max``` - Number that denotes the maximum number of days between password changes. No default.
* ```sp_inact``` - Number that denotes the days after password expire until account is disabled. No default.
* ```sp_warn``` - Number that denotes the number of days to warn before password expires. No default.
* ```chage``` - Path to the ```chage``` binary. Defaults to ```/usr/bin/chage```

### Actions

* ```:set``` - Modifies the corresponding attributes. Default action. If there are no parameters set the resource doesn't do anything.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-my-feature`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Kostas Georgakopoulos (kostas.georgakopoulos@rackspace.co.uk)