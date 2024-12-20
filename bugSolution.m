The solution involves ensuring that the observer is always removed before the observed object is deallocated.  This typically involves implementing a `-dealloc` method, or using appropriate cleanup mechanisms in your view controller's `-viewDidDisappear:` or similar methods.

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *observedString;
@end

@implementation MyClass
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // Handle the KVO notification
}

- (void)startObserving {
    [self addObserver:self forKeyPath:@"observedString" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)stopObserving {
    [self removeObserver:self forKeyPath:@"observedString"];
}

- (void)dealloc {
    [self stopObserving];
    [super dealloc];
}
@end
```

By adding `[self stopObserving]` to the `dealloc` method, we guarantee that the observer is removed before the object is deallocated, preventing the crash.