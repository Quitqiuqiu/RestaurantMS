package com.restaurant.dao;

import com.restaurant.entity.Restaurant;
import com.restaurant.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAO {
    private Connection connection;

    public RestaurantDAO(Connection connection) {
        this.connection = connection;
    }

    public void addRestaurant(Restaurant restaurant) throws SQLException {
        String sql = "INSERT INTO restaurant (name, type, main, category) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, restaurant.getName());
        statement.setString(2, restaurant.getType());
        statement.setString(3, restaurant.getMain());
        statement.setString(4, restaurant.getCategory());
        statement.executeUpdate();
    }

    public void updateRestaurant(Restaurant restaurant) throws SQLException {
        String sql = "UPDATE restaurant SET name = ?, type = ?, main = ?, category = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, restaurant.getName());
        statement.setString(2, restaurant.getType());
        statement.setString(3, restaurant.getMain());
        statement.setString(4, restaurant.getCategory());
        statement.setInt(5, restaurant.getId());
        statement.executeUpdate();
    }

    public void deleteRestaurant(int id) throws SQLException {
        String sql = "DELETE FROM restaurant WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    public Restaurant getRestaurantById(int id) throws SQLException {
        String sql = "SELECT * FROM restaurant WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            Restaurant restaurant = new Restaurant();
            restaurant.setId(resultSet.getInt("id"));
            restaurant.setName(resultSet.getString("name"));
            restaurant.setType(resultSet.getString("type"));
            restaurant.setMain(resultSet.getString("main"));
            restaurant.setCategory(resultSet.getString("category"));
            return restaurant;
        }
        return null;
    }

    public List<Restaurant> getAllRestaurants() throws SQLException {
        List<Restaurant> restaurants = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Restaurant restaurant = new Restaurant();
            restaurant.setId(resultSet.getInt("id"));
            restaurant.setName(resultSet.getString("name"));
            restaurant.setType(resultSet.getString("type"));
            restaurant.setMain(resultSet.getString("main"));
            restaurant.setCategory(resultSet.getString("category"));
            restaurants.add(restaurant);
        }
        return restaurants;
    }

    public List<Restaurant> searchRestaurants(String name, String type, String main, String category) throws SQLException {
        List<Restaurant> restaurants = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM restaurant WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
            params.add("%" + name + "%");
        }
        if (type != null && !type.isEmpty()) {
            sql.append(" AND type LIKE ?");
            params.add("%" + type + "%");
        }
        if (main != null && !main.isEmpty()) {
            sql.append(" AND main LIKE ?");
            params.add("%" + main + "%");
        }
        if (category != null && !category.isEmpty()) {
            sql.append(" AND category LIKE ?");
            params.add("%" + category + "%");
        }

        PreparedStatement statement = connection.prepareStatement(sql.toString());
        for (int i = 0; i < params.size(); i++) {
            statement.setObject(i + 1, params.get(i));
        }

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Restaurant restaurant = new Restaurant();
            restaurant.setId(resultSet.getInt("id"));
            restaurant.setName(resultSet.getString("name"));
            restaurant.setType(resultSet.getString("type"));
            restaurant.setMain(resultSet.getString("main"));
            restaurant.setCategory(resultSet.getString("category"));
            restaurants.add(restaurant);
        }
        return restaurants;
    }
}
