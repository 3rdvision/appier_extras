# [![Appier Framework Extras](res/logo.png)](http://appier_extras.hive.pt)

**Appier with Batteries Included**

Appier Extras is a set of extra elements for [Appier Framework](http://appier.hive.pt).
Amongst other features, it brings an admin interface that is automatically generated
by inspecting the application models, allowing the developer to easily have a way to manage
the data and processes for an instance.

Here's how to launch a minimal app with Appier Extras:

```python
import appier
import appier_extras

class HelloApp(appier.WebApp):

    def __init__(self):
        appier.WebApp.__init__(
            self,
            parts = (
                appier_extras.AdminPart,
            )
        )

HelloApp().serve()
```

Running it is just as simple:

```bash
pip install appier appier_extras
python hello.py
```

You can now go to [http://localhost:8080/admin](http://localhost:8080/admin) and login with root/root.

## Learn more

* [Models](doc/models.md) - extra model features

## License

Appier Extras is currently licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/).

## Build Automation

[![Build Status](https://travis-ci.org/hivesolutions/appier_extras.svg?branch=master)](https://travis-ci.org/hivesolutions/appier_extras)
[![Coverage Status](https://coveralls.io/repos/hivesolutions/appier_extras/badge.svg?branch=master)](https://coveralls.io/r/hivesolutions/appier_extras?branch=master)
[![PyPi Status](https://img.shields.io/pypi/v/appier_extras.svg)](https://pypi.python.org/pypi/appier_extras)
