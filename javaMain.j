import java.util.Scanner;

abstract class PCComponent {
    private String name;
    private double price;

    public PCComponent(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }
}

class CPU extends PCComponent {
    public CPU(String name, double price) {
        super(name, price);
    }
}

class GPU extends PCComponent {
    public GPU(String name, double price) {
        super(name, price);
    }
}

class RAM extends PCComponent {
    public RAM(String name, double price) {
        super(name, price);
    }
}

class Storage extends PCComponent {
    public Storage(String name, double price) {
        super(name, price);
    }
}

class PCSetup {
    private PCComponent[] components;
    private String caseSize;
    private boolean hasRGB;
    private boolean hasLiquidCooling;

    public PCSetup(PCComponent[] components, String caseSize, boolean hasRGB, boolean hasLiquidCooling) {
        this.components = components;
        this.caseSize = caseSize;
        this.hasRGB = hasRGB;
        this.hasLiquidCooling = hasLiquidCooling;
    }

    public double calculateTotalCost() {
        double totalCost = 0;

        for (PCComponent component : components) {
            totalCost += component.getPrice();
        }

        if (caseSize.equalsIgnoreCase("mid")) {
            totalCost += 50;
        } else if (caseSize.equalsIgnoreCase("full")) {
            totalCost += 100;
        }

        if (hasRGB) {
            totalCost += 50;
        }
        if (hasLiquidCooling) {
            totalCost += 100;
        }

        return totalCost;
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Define PC components
        CPU cpu1 = new CPU("Intel Core i5", 200);
        GPU gpu1 = new GPU("Nvidia GeForce GTX 1660", 300);
        RAM ram1 = new RAM("Corsair Vengeance 16GB", 100);
        Storage storage1 = new Storage("Samsung 1TB SSD", 150);

        CPU cpu2 = new CPU("AMD Ryzen 7", 300);
        GPU gpu2 = new GPU("Nvidia GeForce RTX 3070", 500);
        RAM ram2 = new RAM("G.Skill Trident Z RGB 32GB", 200);
        Storage storage2 = new Storage("Western Digital 2TB HDD", 100);

        PCComponent[] components1 = { cpu1, gpu1, ram1, storage1 };
        PCSetup setup1 = new PCSetup(components1, "mid", true, false);

        PCComponent[] components2 = { cpu2, gpu2, ram2, storage2 };
        PCSetup setup2 = new PCSetup(components2, "full", false, true);

        displayConfiguration(setup1);
        System.out.println("Total Cost: $" + setup1.calculateTotalCost());

        displayConfiguration(setup2);
        System.out.println("Total Cost: $" + setup2.calculateTotalCost());

        scanner.close();
    }

    public static void displayConfiguration(PCSetup setup) {
        System.out.println("Case Size: " + setup.getCaseSize());
        System.out.println("Components:");
        for (PCComponent component : setup.getComponents()) {
            System.out.println("- " + component.getName());
        }
        System.out.println("Additional Features:");
        System.out.println("- RGB Lighting: " + (setup.hasRGB() ? "Yes" : "No"));
        System.out.println("- Liquid Cooling: " + (setup.hasLiquidCooling() ? "Yes" : "No"));
    }
}
