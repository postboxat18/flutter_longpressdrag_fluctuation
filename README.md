Here's a professional and well-structured `README.md` file for your Flutter package that you can use on GitHub and pub.dev:

---

# LongPressDraggableCard

A customizable Flutter widget that allows users to **drag a card horizontally to increase or decrease a count** — perfect for cart quantities, counters, or any use case where a drag gesture adjusts a numeric value.
## 📽 Demo

[![Demo](https://github.com/user-attachments/assets/f35feaaa-db68-44fb-9ed9-e5aed653df6e)](https://github.com/user-attachments/assets/f35feaaa-db68-44fb-9ed9-e5aed653df6e)


---

## ✨ Features

* 🔁 Horizontal drag gesture for count control
* 📈 Increase or decrease values dynamically
* ✅ Limit value using `maxCount`
* 🎨 Customizable feedback (`fadeContainer`) and UI (`child`)
* ⚡ Lightweight and easy to integrate

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_longpressdrag_fluctuation: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

```dart
LongPressDraggableCard(
  axis: Axis.horizontal,
  count: quantity,
  maxCount: 50,
  onChanged: (value) {
    setState(() {
      quantity = value;
    });
  },
  fadeContainer: Container(
    height: 200,
    width: 500,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('', style: TextStyle(fontSize: 16)),
            Text('', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ],
    ),
  ),
  child: Container(
    height: 200,
    width: 500,
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("description", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Qty: $quantity', style: TextStyle(fontSize: 16)),
            Text('\$10', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ],
    ),
  ),
);
```

---

## 🔧 Parameters

| Property        | Type            | Description                                      |
| --------------- | --------------- | ------------------------------------------------ |
| `axis`          | `Axis`          | Direction of drag (default: `Axis.horizontal`)   |
| `count`         | `int`           | Current value to display and update              |
| `maxCount`      | `int`           | Maximum count limit                              |
| `onChanged`     | `Function(int)` | Callback triggered when the count changes        |
| `fadeContainer` | `Widget`        | Transparent feedback widget shown while dragging |
| `child`         | `Widget`        | Main card widget shown to the user               |

---

## 📌 How it Works

* `LongPressDraggableCard` listens for **long press + horizontal drag**.
* Internally, it uses `onDragUpdate` to check the `offset.dx`:

    * Positive → **increase count**
    * Negative → **decrease count**
* When the drag ends, `onDragEnd` resets the feedback offset.

---

## 🧪 Example Use Cases

* Shopping cart item quantity control
* Rating widgets with adjustable values
* Custom counters

---

## 💡 Tips

* Always include a transparent `fadeContainer` to ensure draggable feedback works.
* Use state management (like `setState`, Provider, etc.) to persist and respond to value changes.

---

## 📄 License

[MIT](LICENSE)

---

