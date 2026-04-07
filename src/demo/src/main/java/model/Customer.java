package model;

public class Customer {
    private String name;
    private String birthDate;
    private String address;
    private String imagePath;

    public Customer(String name, String birthDate, String address, String imagePath) {
        this.name = name;
        this.birthDate = birthDate;
        this.address = address;
        this.imagePath = imagePath;
    }

    public String getName() { return name; }
    public String getBirthDate() { return birthDate; }
    public String getAddress() { return address; }
    public String getImagePath() { return imagePath; }
}