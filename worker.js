const worker = {
    async fetch(request, env, ctx) {
        const readable = new ReadableStream({
            type: 'bytes',
            pull: (controller) => {
                controller.enqueue(new TextEncoder().encode('Hello World!'));
                controller.close();
            },
        });

        let response = new Response(readable, {
            status: 200,
            headers: {
                'Content-Type': 'text/html; charset=utf-8',
            },
        });

        response = new HTMLRewriter().transform(response);

        return response;
    },
};

export default worker;
