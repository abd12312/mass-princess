import ProductForm from "@/components/admin/product-form";

export default function EditProductPage({ params }: { params: { id: string } }) {
  return (
    <div>
      <h1 className="mb-6 text-2xl font-bold">تعديل منتج</h1>
      <ProductForm productId={params.id} />
    </div>
  );
}
