# Safe Area Layout Guide Convenience API

This document demonstrates the new Safe Area convenience APIs added to SnapKit.

## Basic Usage

### Before (Standard Approach)
```swift
view.snp.makeConstraints { make in
    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
    make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
    make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
}
```

### After (With Convenience API)
```swift
// Using individual safe area properties
view.snp.makeConstraints { make in
    make.top.equalTo(superview.snp.safeAreaTop)
    make.leading.equalTo(superview.snp.safeAreaLeading)
    make.trailing.equalTo(superview.snp.safeAreaTrailing)
    make.bottom.equalTo(superview.snp.safeAreaBottom)
}

// Or using safe area edges
view.snp.makeConstraints { make in
    make.edges.equalTo(superview.snp.safeAreaEdges)
}

// Or using the convenience method
view.snp.makeConstraintsToSafeArea()
```

## Advanced Usage

### With Insets
```swift
// Apply insets to safe area
view.snp.makeConstraintsToSafeArea(insets: UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16))
```

### With Additional Constraints
```swift
view.snp.makeConstraintsToSafeArea { make in
    // Safe area edges are already set, add more constraints
    make.height.equalTo(200)
}
```

### Centering in Safe Area
```swift
view.snp.makeConstraints { make in
    make.center.equalTo(superview.snp.safeAreaCenter)
    make.size.equalTo(100)
}
```

### Update and Remake
```swift
// Update existing constraints to safe area
view.snp.updateConstraintsToSafeArea()

// Remake all constraints to safe area
view.snp.remakeConstraintsToSafeArea(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```

## Benefits

1. **Cleaner Code**: Less verbose than repeatedly accessing `safeAreaLayoutGuide`
2. **Consistency**: Follows SnapKit's existing API patterns
3. **Convenience Methods**: Quick methods for common safe area constraint patterns
4. **Type Safety**: Compile-time checks for iOS 11.0+ availability