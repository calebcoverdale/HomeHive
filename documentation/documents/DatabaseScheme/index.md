🚀 HomeHive API Reference

This document outlines the API for interacting with the HomeHive inventory application's data models.

## Table of Contents

- [Models](#models)
  - [Item](#item)
  - [Category](#category)
  - [Location](#location)
  - [User](#user)
- [Usage](#usage)
  - [Creating Records](#creating-records)
  - [Reading Records](#reading-records)
  - [Updating Records](#updating-records)
  - [Deleting Records](#deleting-records)

---

## Models

### Item 📦

Represents an inventory item.

| Property | Type | Description |
| --- | --- | --- |
| `id` | `number` | Unique identifier |
| `name` | `string` | Name of the item |
| `category` | `Category` | Associated category |
| `location` | `Location` | Storage location |
| `quantity` | `number` | Quantity in stock |
| `dateAdded` | `Date` | Date of addition |
| `user` | `User` | User who added the item |

### Category 🏷️

Represents a category of items.

| Property | Type | Description |
| --- | --- | --- |
| `id` | `number` | Unique identifier |
| `name` | `string` | Name of the category |
| `items` | `Item[]` | Items in this category |

### Location 📍

Represents a location where items are stored.

| Property | Type | Description |
| --- | --- | --- |
| `id` | `number` | Unique identifier |
| `name` | `string` | Name of the location |
| `items` | `Item[]` | Items in this location |

### User 👤

Represents a user.

| Property | Type | Description |
| --- | --- | --- |
| `id` | `number` | Unique identifier |
| `username` | `string` | Username |
| `passwordHash` | `string` | Hashed password |
| `email` | `string` | Email address |
| `items` | `Item[]` | Items added by the user |

---

## Usage

### Creating Records

Example: Adding a new item.

```typescript
const newItem = new Item();
newItem.name = "Desk Lamp";
newItem.quantity = 1;
// ... set other properties
await repository.save(newItem);
```

### Reading Records

Example: Fetching all items in a category.

```typescript
const items = await repository.find({
  where: { category: { name: "Electronics" }}
});
```

### Updating Records

Example: Updating item quantity.

```typescript
await repository.update({ id: itemId }, { quantity: newQuantity });
```

### Deleting Records

Example: Removing an item.

```typescript
await repository.delete({ id: itemId });
```

---

💡 _This API reference is a starting point and may be expanded as the HomeHive project evolves._

---
