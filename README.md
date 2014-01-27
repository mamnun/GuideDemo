Guide Demo Notes
=========

  - Model classes are generated using [Objectify]
  - NSCache is used for in-memory data storage
  - Opensource libraries used:
    - [CocoaPods] for dependency management
    - [AFNetworking] for networking
    - [SVPullToRefresh] for infinite scrolling

For the date storage, core data was the obvious choice. Since it was out of scope, there were several options like circular queue, sliding window, ring buffer. But NSCache was chosen due to faster implementation, low maintenance and its overall performance in general cases.

UI related codes are kept minimum for clarity.

[Objectify]:http://tigerbears.com/objectify/
[CocoaPods]:http://cocoapods.org/
[AFNetworking]:https://github.com/AFNetworking/AFNetworking
[SVPullToRefresh]:https://github.com/samvermette/SVPullToRefresh

    
