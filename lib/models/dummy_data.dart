class DummyData {
  var dynamicDummyData = [
    {
      'title': 'All',       //For Text Widget
      'value': false,       // used for checkbox value
      'key': 1,             // key used to identify parent child relation
      'hasChild': true,     // hase child or not
      'parent': 'null'      // to link parent with child
    },
    {
      'title': 'Public',
      'key': 2,
      'value': false,
      'hasChild': false,
      'parent': 'All'
    },
    {
      'title': 'Internal',
      'key': 2,
      'value': false,
      'hasChild': false,
      'parent': 'All'
    },
    {
      'title': 'Private Subscription',
      'key': 2,
      'value': false,
      'hasChild': true,
      'parent': 'All'
    },
    {
      'title': 'Host A',
      'key': 3,
      'value': false,
      'hasChild': false,
      'parent': 'Private Subscription'
    },
    {
      'title': 'Host B',
      'key': 3,
      'value': false,
      'hasChild': false,
      'parent': 'Private Subscription'
    },
    {
      'title': 'Host C',
      'key': 3,
      'value': false,
      'hasChild': false,
      'parent': 'Private Subscription'
    },
    {
      'title': 'Following',
      'key': 2,
      'value': false,
      'hasChild': true,
      'parent': 'All'
    },
    {
      'title': 'Institution',
      'key': 3,
      'value': false,
      'hasChild': true,
      'parent': 'Following'
    },
    {
      'title': 'Institute A',
      'key': 4,
      'value': false,
      'hasChild': false,
      'parent': 'Institution'
    },
    {
      'title': 'Institute B',
      'key': 4,
      'value': false,
      'hasChild': false,
      'parent': 'Institution'
    },
    {
      'title': 'I Can',
      'key': 5,
      'value': false,
      'hasChild': true,
      'parent': 'Institution'
    },
    {
      'title': 'Inherited',
      'key': 6,
      'value': false,
      'hasChild': false,
      'parent': 'I Can'
    },
    {
      'title': 'Multiple Level',
      'key': 6,
      'value': false,
      'hasChild': true,
      'parent': 'I Can'
    },
    {
      'title': 'Like 1',
      'key': 7,
      'value': false,
      'hasChild': false,
      'parent': 'Multiple Level'
    },
    {
      'title': 'Like 2',
      'key': 7,
      'value': false,
      'hasChild': false,
      'parent': 'Multiple Level'
    },
    {
      'title': 'Like 3',
      'key': 7,
      'value': false,
      'hasChild': false,
      'parent': 'Multiple Level'
    },
  ];

  // var dumyData = {
  //   'all': {
  //     [
  //       'Public',
  //       'Internal',
  //       'Private',
  //     ],
  //     {
  //       'Private Subscription': ['Host A', 'Host B', 'Host C']
  //     },
  //     {
  //       'Following': {
  //         'Institution': ['Institute A', 'Institute B', 'Institute C']
  //       }
  //     },
  //   }
  // };
  // Map<String, dynamic> nestedMap = {
  //   "All": false,
  //   "Private Subscriptions": {
  //     "Subscription A": false,
  //     "institution": {"Institution A": false, "Institution B": false}
  //   },
  //   "Following": false
  // };
}
